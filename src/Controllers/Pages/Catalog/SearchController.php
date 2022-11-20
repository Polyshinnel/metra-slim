<?php


namespace App\Controllers\Pages\Catalog;


use App\Models\Product;

class SearchController
{
    public static function getSearchResults($data,$country)
    {
        $searchResultArr = [];
        $searchQuery = $data['search'];

        $productModel = new Product();

        $searchFields = [
            'sku',
            'name',
            'description'
        ];

        foreach ($searchFields as $searchField)
        {
            $searchResults = $productModel->where($searchField,'LIKE','%'.$searchQuery.'%')->get()->toArray();
            foreach ($searchResults as $searchResult)
            {
                if($searchResult['quantity'] == 0){
                    $statusClass = 'out-of-stock';
                    $status = 'Под заказ';
                }else{
                    $statusClass = 'in-stock';
                    $status = 'В наличии';
                }

                if($country == 'kz') {
                    $searchResult['price'] = $searchResult['kz_price'];
                }

                $searchResult['status'] = $status;
                $searchResult['statusClass'] = $statusClass;

                $searchResultArr[] = $searchResult;
            }
        }

        return [
            'search' => $searchQuery,
            'searchResult' => $searchResultArr
        ];
    }
}