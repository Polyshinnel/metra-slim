<?php


namespace App\Controllers\Tkp;


use App\Models\TkpAuto;
use PhpOffice\PhpWord\Exception\CopyFileException;
use PhpOffice\PhpWord\Exception\CreateTemporaryFileException;
use PhpOffice\PhpWord\TemplateProcessor;

class CreateTkpAuto
{
    public static function createTkp($data)
    {
        $tkpId = $data['id'];
        $customerName = $data['customerName'];
        $instalationPlace = $data['instalationPlace'];
        $expiredDate = $data['expiredDate'];

        $tkpInfo = TkpAuto::where('id',$tkpId)->first()->toArray();

        $template = __DIR__.'../../../../public/assets/cabinet-materials/tkp'.$tkpInfo['path'];
        try {
            $templateProcessor = new TemplateProcessor($template);
            $templateProcessor->setValue('customerName', $customerName);
            $templateProcessor->setValue('instalationPlace', $instalationPlace);
            $templateProcessor->setValue('expiredDate', $expiredDate);


            $file = 'tkp.docx';
            $templateProcessor->saveAs($file);


            header("Content-Disposition: attachment; filename=tkp.docx");
            readfile($file); // or echo file_get_contents($temp_file);
            unlink($file); // remove temp file
        } catch (CopyFileException $e) {
            print_r($e);
        } catch (CreateTemporaryFileException $e) {
            print_r($e);
        }



    }
}