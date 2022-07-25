<?php


namespace App\Controllers\Pages\Catalog;


use App\Models\Product;
use App\Utils\CommonHelper;

class ProductController
{
    public static function getProduct($id)
    {
        $product = Product::where('id',$id)->get()->toArray();
        $product = $product[0];
        if($product['quantity'] == 0){
            $statusClass = 'out-of-stock';
            $status = 'Под заказ';
        }else{
            $statusClass = 'in-stock';
            $status = 'В наличии';
        }

        $price = CommonHelper::normalizePrice($product['price']).'  ₽';
        $categoryId = $product['category_id'];

        $rootCat = CatalogController::checkCategory($categoryId,[]);
        $rootCat = array_reverse($rootCat);
        unset($rootCat[0]);

        $breadCrumbs = [
            [
                'url' => '/',
                'name' => 'Главная'
            ],
            [
                'url' => '/catalog',
                'name' => 'Каталог'
            ]
        ];

        foreach ($rootCat as $rootUnit)
        {
            $breadCrumbs[] = [
                'url' => '/catalog?parent='.$rootUnit['id'],
                'name' => $rootUnit['name']
            ];
        }

        $lastCrumb = $product['name'];

        $productFinal = [
            'id' => $product['id'],
            'name' => $product['name'],
            'sku' => $product['sku'],
            'description' => $product['description'],
            'img' => $product['img'],
            'price' => $price,
            'status' => $status,
            'statusClass' => $statusClass
        ];

        print_r($lastCrumb);

        return [
            'product' => $productFinal,
            'breadcrumbs' => $breadCrumbs,
            'lust_crumb' => $lastCrumb
        ];
    }
}