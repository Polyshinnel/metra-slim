<?php


namespace App\Controllers\Parser;


class IntegrationParser
{
    private $xmlPath;

    public function __construct($xmlPath)
    {
        $this->xmlPath = $xmlPath;
    }

    public function processingXml()
    {
        $xml = $this->getXml();
    }

    public function getXml()
    {
        return simplexml_load_file($this->xmlPath);
    }

    public function serializeXml()
    {
        $xml = $this->getXml();
        $products = $xml->product;
        $productsArr = [];

        foreach ($products as $product)
        {
            $name = (string)$product->name_product;
            $category = (string)$product->category;
            $price = (int)$product->price;
            $quantity = (int)$product->quantity;
            $sku = (string)$product->articul;
            $description = (string)$product->description;
            $img = (string)$product->img;
            $kzPrice = (int)$product->kz_price;

            if($img == '')
            {
                $img = '/assets/img/no-image.jpg';
            }

            $categoryArr = explode(', ',$category);
            if(count($categoryArr) > 1)
            {
                foreach ($categoryArr as $categoryItem)
                {
                    $productsArr[] = [
                        'name' => $name,
                        'category' => $categoryItem,
                        'price' => $price,
                        'quantity' => $quantity,
                        'sku' => $sku,
                        'description' => $description,
                        'img' => $img,
                        'kz_price' => $kzPrice
                    ];
                }
            }
            else
            {
                $productsArr[] = [
                    'name' => $name,
                    'category' => $category,
                    'price' => $price,
                    'quantity' => $quantity,
                    'sku' => $sku,
                    'description' => $description,
                    'img' => $img,
                    'kz_price' => $kzPrice
                ];
            }

        }

        return $productsArr;

    }
}