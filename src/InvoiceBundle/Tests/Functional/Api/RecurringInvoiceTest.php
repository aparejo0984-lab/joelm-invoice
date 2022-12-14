<?php

declare(strict_types=1);

/*
 * This file is part of SolidInvoice project.
 *
 * (c) Pierre du Plessis <open-source@solidworx.co>
 *
 * This source file is subject to the MIT license that is bundled
 * with this source code in the file LICENSE.
 */

namespace SolidInvoice\InvoiceBundle\Tests\Functional\Api;

use Liip\TestFixturesBundle\Test\FixturesTrait;
use SolidInvoice\ApiBundle\Test\ApiTestCase;
use SolidInvoice\InstallBundle\Test\EnsureApplicationInstalled;

/**
 * @group functional
 */
class RecurringInvoiceTest extends ApiTestCase
{
    use FixturesTrait;
    use EnsureApplicationInstalled;

    public function setUp(): void
    {
        parent::setUp();

        $this->loadFixtures([
            'SolidInvoice\ClientBundle\DataFixtures\ORM\LoadData',
            'SolidInvoice\InvoiceBundle\DataFixtures\ORM\LoadData',
        ], true);
    }

    public function testCreate(): void
    {
        $date = date(\DateTimeInterface::ATOM);

        $data = [
            'users' => [
                '/api/contacts/1',
            ],
            'client' => '/api/clients/1',
            'frequency' => '* * * * *',
            'dateStart' => $date,
            'dateEnd' => null,
            'discount' => [
                'type' => 'percentage',
                'value' => 10,
            ],
            'items' => [
                [
                    'price' => 100,
                    'qty' => 1,
                    'description' => 'Foo Item',
                ],
            ],
        ];

        $result = $this->requestPost('/api/recurring_invoices', $data);

        static::assertEquals([
            'id' => 2,
            'status' => 'draft',
            'client' => '/api/clients/1',
            'frequency' => '* * * * *',
            'dateStart' => date('Y-m-d\T00:00:00+02:00'),
            'dateEnd' => null,
            'total' => '$90.00',
            'baseTotal' => '$100.00',
            'tax' => '$0.00',
            'discount' => [
                'type' => 'percentage',
                'value' => 10,
            ],
            'terms' => null,
            'notes' => null,
            'items' => [
                [
                    'id' => 3,
                    'description' => 'Foo Item',
                    'price' => '$100.00',
                    'qty' => 1,
                    'tax' => null,
                    'total' => '$100.00',
                ],
            ],
            'users' => [
                '/api/contacts/1',
            ],
        ], $result);
    }

    public function testDelete()
    {
        $this->requestDelete('/api/recurring_invoices/1');
    }

    public function testGet()
    {
        $data = $this->requestGet('/api/recurring_invoices/1');

        unset($data['uuid']);

        static::assertEquals([
            'id' => 1,
            'status' => 'draft',
            'client' => '/api/clients/1',
            'frequency' => '* * * * *',
            'dateStart' => '2012-01-01T00:00:00+02:00',
            'dateEnd' => null,
            'total' => '$100.00',
            'baseTotal' => '$100.00',
            'tax' => '$0.00',
            'discount' => [
                'type' => null,
                'value' => null,
            ],
            'terms' => null,
            'notes' => null,
            'items' => [
                [
                    'id' => 2,
                    'description' => 'Test Item',
                    'price' => '$100.00',
                    'qty' => 1,
                    'tax' => null,
                    'total' => '$100.00',
                ],
            ],
            'users' => [
                '/api/contacts/1',
            ],
        ], $data);
    }

    public function testEdit()
    {
        $data = $this->requestPut(
            '/api/recurring_invoices/1',
            [
                'frequency' => '5 * * * *',
                'discount' => [
                    'type' => 'percentage',
                    'value' => 10,
                ],
                'items' => [
                    [
                        'price' => 100,
                        'qty' => 1,
                        'description' => 'Foo Item',
                    ],
                ],
            ]
        );

        unset($data['uuid']);

        static::assertEquals([
            'id' => 1,
            'status' => 'draft',
            'client' => '/api/clients/1',
            'frequency' => '5 * * * *',
            'dateStart' => '2012-01-01T00:00:00+02:00',
            'dateEnd' => null,
            'total' => '$90.00',
            'baseTotal' => '$100.00',
            'tax' => '$0.00',
            'discount' => [
                'type' => 'percentage',
                'value' => 10,
            ],
            'terms' => null,
            'notes' => null,
            'items' => [
                [
                    'id' => 3,
                    'description' => 'Foo Item',
                    'price' => '$100.00',
                    'qty' => 1,
                    'tax' => null,
                    'total' => '$100.00',
                ],
            ],
            'users' => [
                '/api/contacts/1',
            ],
        ], $data);
    }
}
