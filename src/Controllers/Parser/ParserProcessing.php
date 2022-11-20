<?php


namespace App\Controllers\Parser;


use App\Controllers\telegram\TelegramService;
use App\Models\AdminList;
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

        $text = 'Обработка выгрузки завершена. Обновлено: '.$updateCount.'. Создано: '.$createCount;
        $telegramService = new TelegramService(tokenTelegram);
        $adminArr = AdminList::all()->toArray();
        foreach ($adminArr as $adminItem)
        {
            $telegramService->sendMessage($adminItem['chat_id'],$text);
        }

        return $text;
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
        $kz_price = $product['kz_price'];


        $filter = [
            'name' => $name,
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
                    'quantity' => $quantity,
                    'kz_price' => $kz_price
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
                'quantity' => $quantity,
                'kz_price' => $kz_price
            ];

            $this->productModel->create($createArr);

            return 'created';
        }
    }
}