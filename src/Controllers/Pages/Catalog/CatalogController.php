<?php


namespace App\Controllers\Pages\Catalog;


use App\Models\Category;
use App\Models\Product;
use App\Utils\CommonHelper;

class CatalogController
{
    public static function getCategoriesAndProducts($data,$country)
    {
        $parent = 0;
        if(!empty($data['parent']))
        {
            $parent = $data['parent'];
        }

        $categories = Category::where('parent',$parent)->get()->toArray();
        if(empty($categories))
        {
            $categories = Null;
        }

        $productsRaw = Product::where('category_id',$parent)->get()->toArray();
        $products = [];
        foreach ($productsRaw as $product)
        {
            if($product['quantity'] == 0){
                $statusClass = 'out-of-stock';
                $status = 'Под заказ';
            }else{
                $statusClass = 'in-stock';
                $status = 'В наличии';
            }

            $price = $product['price'];

            if(($country == 'kz') || ($country == 'bel')) {
                $price = $product['kz_price'];
            }

            $price = CommonHelper::normalizePrice($price).' ₽';

            $products[] = [
                'id' => $product['id'],
                'name' => $product['name'],
                'sku' => $product['sku'],
                'description' => $product['description'],
                'img' => $product['img'],
                'price' => $price,
                'status' => $status,
                'statusClass' => $statusClass,
            ];
        }


        if(empty($products))
        {
            $products = Null;
        }

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

        $rootCat = [];
        $rootCat = self::checkCategory($parent,$rootCat);
        $rootCat = array_reverse($rootCat);
        unset($rootCat[0]);


        foreach ($rootCat as $rootUnit)
        {
            $breadCrumbs[] = [
                'url' => '/catalog?parent='.$rootUnit['id'],
                'name' => $rootUnit['name']
            ];
        }

        $lastCrumb = array_pop($breadCrumbs);


        return [
            'categories' => $categories,
            'products' => $products,
            'breadcrumbs' => $breadCrumbs,
            'lastCrumb' => trim($lastCrumb['name'])
        ];

    }

    public static function checkCategory($parent,$rootCat)
    {
        $category = Category::where('id',$parent)->get()->toArray();
        if(!empty($category)){
            $rootCat[] = $category[0];
        }

        if($parent == 0)
        {
            return $rootCat;
        }
        else
        {
            $newParent = $rootCat[count($rootCat)-1]['parent'];
            return self::checkCategory($newParent,$rootCat);
        }
    }
}