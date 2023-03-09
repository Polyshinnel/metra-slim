<?php


namespace App\Controllers\Utils;


class UploadImg
{
    public static function uploadImg() {
        $inputName = 'userFile';

        $deny = array(
            'phtml', 'php', 'php3', 'php4', 'php5', 'php6', 'php7', 'phps', 'cgi', 'pl', 'asp',
            'aspx', 'shtml', 'shtm', 'htaccess', 'htpasswd', 'ini', 'log', 'sh', 'js', 'html',
            'htm', 'css', 'sql', 'spl', 'scgi', 'fcgi', 'exe'
        );

        $path = __DIR__.'/../../../public/uploads/';

        //check dir to upload
        if(!file_exists($path)) {
            mkdir($path);
            chmod($path,0777);
        }

        $error = '';
        $fileAddr = '';
        $translitFilename = '';

        $file = $_FILES[$inputName];

        if (!isset($_FILES[$inputName])) {
            $error = 'Файл не загружен.';
        }

        if (!empty($file['error']) || empty($file['tmp_name'])) {
            $error = 'Не удалось загрузить файл.';
        }

        if ($file['tmp_name'] == 'none' || !is_uploaded_file($file['tmp_name'])) {
            $error = 'Не удалось загрузить файл.';
        }

        if($error == '') {
            $pattern = "[^a-zа-яё0-9,~!@#%^-_\$\?\(\)\{\}\[\]\.]";
            $name = mb_eregi_replace($pattern, '-', $file['name']);
            $name = mb_ereg_replace('[-]+', '-', $name);
            $parts = pathinfo($name);
            $fileName = $parts['filename'];
            $ext = $parts['extension'];

            $fileName = self::translitFile($fileName);
            $translitFilename = $fileName.'.'.$ext;

            $fileErr = '';

            if (empty($name) || empty($parts['extension'])) {
                $fileErr = 'Недопустимый тип файла';
            }

            if (!empty($deny) && in_array(strtolower($parts['extension']), $deny)) {
                $fileErr = 'Недопустимый тип файла';
            }

            if($fileErr == '') {
                if (move_uploaded_file($file['tmp_name'], $path . $translitFilename)) {
                    $fileAddr = '/uploads/'.$translitFilename;
                }
            } else {
                $error = $fileErr;
            }
        }

        $jsonArr = [
            'err' => $error,
            'fileAddr' => $fileAddr,
            'fileName' => $translitFilename
        ];

        return json_encode($jsonArr,JSON_UNESCAPED_UNICODE);
    }

    public static function translitFile($filename) {
        $converter = array(
            'а' => 'a',    'б' => 'b',    'в' => 'v',    'г' => 'g',    'д' => 'd',
            'е' => 'e',    'ё' => 'e',    'ж' => 'zh',   'з' => 'z',    'и' => 'i',
            'й' => 'y',    'к' => 'k',    'л' => 'l',    'м' => 'm',    'н' => 'n',
            'о' => 'o',    'п' => 'p',    'р' => 'r',    'с' => 's',    'т' => 't',
            'у' => 'u',    'ф' => 'f',    'х' => 'h',    'ц' => 'c',    'ч' => 'ch',
            'ш' => 'sh',   'щ' => 'sch',  'ь' => '',     'ы' => 'y',    'ъ' => '',
            'э' => 'e',    'ю' => 'yu',   'я' => 'ya',

            'А' => 'A',    'Б' => 'B',    'В' => 'V',    'Г' => 'G',    'Д' => 'D',
            'Е' => 'E',    'Ё' => 'E',    'Ж' => 'Zh',   'З' => 'Z',    'И' => 'I',
            'Й' => 'Y',    'К' => 'K',    'Л' => 'L',    'М' => 'M',    'Н' => 'N',
            'О' => 'O',    'П' => 'P',    'Р' => 'R',    'С' => 'S',    'Т' => 'T',
            'У' => 'U',    'Ф' => 'F',    'Х' => 'H',    'Ц' => 'C',    'Ч' => 'Ch',
            'Ш' => 'Sh',   'Щ' => 'Sch',  'Ь' => '',     'Ы' => 'Y',    'Ъ' => '',
            'Э' => 'E',    'Ю' => 'Yu',   'Я' => 'Ya',
        );

        $filename = strtr($filename, $converter);
        return $filename;
    }
}