<?php

namespace backend\models;

use yii;
use yii\base\Model;
use yii\web\UploadedFile;
use backend\models\UploadedFile as uploadModel;

class UploadForm extends Model {

    /**
     * @var UploadedFile[]
     */
    public $imageFiles;
    public $smallFiles;

    public function rules() {
        return [
            [['imageFiles'], 'file', 'skipOnEmpty' => false, 'extensions' => 'png, jpg', 'maxFiles' => 10, 'on' => 'create'],
            [['smallFiles'], 'file', 'skipOnEmpty' => false, 'extensions' => 'png, jpg', 'maxFiles' => 10, 'on' => 'create'],
            [['imageFiles'], 'file', 'skipOnEmpty' => true, 'extensions' => 'png, jpg', 'maxFiles' => 10, 'on' => 'update'],
            [['smallFiles'], 'file', 'skipOnEmpty' => true, 'extensions' => 'png, jpg', 'maxFiles' => 10, 'on' => 'update'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'imageFiles' => Yii::t('app', 'Image (720 X 400)'),
            'smallFiles' => Yii::t('app', 'Small (120 X 120)'),
        ];
    }

    public function upload($reference_id = null, $reference_type = null) {
        
        if ($this->validate()) {
            
            $path = $this->getUploadPath($reference_type);
            if(empty($path)) return false;
            
            foreach ($this->imageFiles as $file) {
                $filename = $file->baseName . time() . '-big.' . $file->extension;
                $file->saveAs($path['upload_full_path'] . $filename);
                $uploadedFileObj = new uploadModel();

                $fileInfo["UploadedFile"] = [
                    'reference_id' => (int) $reference_id,
                    'reference_type' => $reference_type,
                    'name' => $file->name,
                    'filename' => $filename,
                    'size' => $file->size,
                    'type' => 'Big',
                    'path' => $path['upload_path'] . $filename,
                    'cover_image' => 1
                ];
                

                if ($uploadedFileObj->load($fileInfo, 'UploadedFile')) {
                    $isValid = $uploadedFileObj->validate();
                    
                    if ($isValid) {
                        $uploadedFileObj->save(false);
                    }
                }
            }

            foreach ($this->smallFiles as $file) {
                $filename = $file->baseName . time() . '-small.' . $file->extension;
                $file->saveAs($path['upload_full_path'] . $filename);
                $uploadedFileObj = new uploadModel();

                $fileInfo["UploadedFile"] = [
                    'reference_id' => (int) $reference_id,
                    'reference_type' => $reference_type,
                    'name' => $file->name,
                    'filename' => $filename,
                    'size' => $file->size,
                    'type' => 'Small',
                    'path' => $path['upload_path'] . $filename,
                    'cover_image' => 0
                ];

                if ($uploadedFileObj->load($fileInfo, 'UploadedFile')) {
                    $isValid = $uploadedFileObj->validate();
                    
                    if ($isValid) {
                        $uploadedFileObj->save(false);
                    }
                }
            }
            return true;
        } else {
            return false;
        }
    }

    public function deleteAllUploadedFile($reference_id, $reference_type, $imageType = null) {
        if (empty($reference_id) || empty($reference_type))
            return false;
        $path = $this->getUploadPath($reference_type);
        if(empty($path)) return false;
        
        $uploadedFileObj = new uploadModel();
        $data = $uploadedFileObj->getImageList($reference_id, $reference_type);
        if (empty($data))
            return false;
        foreach ($data as $val) {
            unlink($path['upload_full_path'] . $val['filename']);
        }
        $dataRow = $uploadedFileObj->deleteAllImage($reference_id, $reference_type);
    }

    public function getImageList($reference_id, $reference_type, $type = null) {

        $uploadedFileObj = new uploadModel();
        $data = $uploadedFileObj->getImageList($reference_id, $reference_type, $type);
        if (!empty($data)) {
            return $data;
        }
        return [];
    }
    
    public function getUploadPath($reference_type) {
        
        $upload_path = "";
        $upload_full_path = "";
        $basePath = \Yii::$app->basePath . \common\models\SiteConfig::getConfigVal('_Relative_Upload_Path');
        if (strtolower($reference_type) == 'restaurant') {
           $upload_path = \common\models\SiteConfig::getConfigVal('_Restaurant_Upload_Path');
            $upload_full_path = $basePath . $upload_path;
        }elseif (strtolower($reference_type) == 'services') {
            $upload_path = \common\models\SiteConfig::getConfigVal('_Services_Upload_Path');
            $upload_full_path = $basePath . $upload_path;
        }elseif (strtolower($reference_type) == 'city') {
            $upload_path = \common\models\SiteConfig::getConfigVal('_City_Upload_Path');
            $upload_full_path = $basePath . $upload_path;
        }elseif (strtolower($reference_type) == 'siteseen') {
            $upload_path = \common\models\SiteConfig::getConfigVal('_SiteSeen_Upload_Path');
            $upload_full_path = $basePath . $upload_path;
        }
        
        
        if(empty($upload_path ) && empty($upload_full_path)){
            $upload_path = \common\models\SiteConfig::getConfigVal('_Upload_Path');
            $upload_full_path = $basePath . $upload_path;
        }
        
        return array('upload_path' => $upload_path,'upload_full_path' => $upload_full_path);
        
    }

}
