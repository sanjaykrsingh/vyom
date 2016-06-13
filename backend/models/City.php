<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "city".
 *
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property string $description
 * @property string $country_name
 * @property string $latitude
 * @property string $longitude
 */
class City extends \yii\db\ActiveRecord {

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'city';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['name', 'code'], 'required'],
            [['name', 'code', 'country_name'], 'string', 'max' => 255],
            [['description'], 'string', 'max' => 2048],
            [['latitude', 'longitude'], 'number']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'code' => Yii::t('app', 'Code'),
            'description' => Yii::t('app', 'Description'),
            'country_name' => Yii::t('app', 'Country Name'),
            'latitude' => Yii::t('app', 'Latitude'),
            'longitude' => Yii::t('app', 'Longitude'),
        ];
    }

    public function getAllCities() {
        return $this->find()->orderBy('name')->all();
    }

   
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getImages() {
        $imagePath = \common\models\SiteConfig::getConfigVal('_Image_WebSite_Path');
        return $this->hasMany(UploadedFile::className(), ['reference_id' => 'id'])
                        ->andOnCondition(['reference_type' => 'City'])->select(['type','filename',"concat('".$imagePath."' , `uploaded_file`.`path`) as 'path'"]);
    }

    public function extraFields() {
        return ['images'];
    }

    public function fields() {
        return ['id','name', 'code'];
    }

}
