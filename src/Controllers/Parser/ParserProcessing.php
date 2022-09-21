<?php


namespace App\Controllers\Parser;


use App\Models\Product;

class ParserProcessing
{
    private $productModel;
    private $parser;

    public function __construct(Product $productModel,IntegrationParser $parser)
    {
        $this->productModel = $productModel;
        $this->parser = $parser;
    }

    public function productProcessing()
    {
        $products = $this->parser->serializeXml();

        $updateCount = 0;
        $createCount = 0;

        foreach ($products as $product)
        {
            $processingResult = $this->createOrUpdateProduct($product);

            if($processingResult == 'updated')
            {
                $updateCount++;
            }

            if($processingResult == 'created')
            {
                $createCount++;
            }
        }

        return 'Обработка выгрузки завершена. Обновлено: '.$updateCount.'. Создано: '.$createCount;
    }

    private function createOrUpdateProduct($product)
    {
        $name = $product['name'];
        $category = $product['category'];
        $price = $product['price'];
        $quantity = $product['quantity'];
        $sku = $product['sku'];
        $description = $product['description'];
        $img = $product['img'];


        $filter = [
            'sku' => $sku,
            'category_id' => $category,
        ];

        $searchResult = $this->productModel->where($filter)->get()->toArray();

        if(!empty($searchResult))
        {
            $id = $searchResult[0]['id'];
            $currPrice = $searchResult[0]['price'];
            $currQuant = $searchResult[0]['quantity'];

            if(($currPrice != $price) || ($currQuant != $quantity))
            {
                $updateArr = [
                    'price' => $price,
                    'quantity' => $quantity
                ];

                $this->productModel->where('id',$id)->update($updateArr);

                return 'updated';
            }
        }
        else
        {
            $createArr = [
                'name' => $name,
                'category_id' => $category,
                'sku' => $sku,
                'description' => $description,
                'img' => $img,
                'price' => $price,
                'quantity' => $quantity
            ];

            $this->productModel->create($createArr);

            return 'created';
        }
    }
}