<?php

namespace backend\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "services".
 *
 * @property integer $id
 * @property integer $city_id
 * @property string $type
 * @property string $title
 * @property string $Description
 * @property string $open_time 
 * @property string $close_time 
 * @property string $address
 * @property string $phone_no1
 * @property string $phone_no2
 * @property string $latitude
 * @property string $longitude
 * @property string $created_at
 * @property string $updated_at
 */
class Services extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'services';
    }
    
  
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => 'updated_at',
                ],
                'value' => function($event) {
                    $format = "Y-m-d h:i:s"; // any format you wish
                    return date($format); 
                }
            ],
                    
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['city_id', 'type', 'title', 'address'], 'required'],
            [['city_id'], 'integer'],
            [['type', 'Description'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['title'], 'string', 'max' => 1024],
            [['open_time','close_time','address'], 'string'],
            [['phone_no1', 'phone_no2'], 'string'],
            [['latitude', 'longitude'], 'number']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'city_id' => Yii::t('app', 'City'),
            'type' => Yii::t('app', 'Type'),
            'title' => Yii::t('app', 'Name'),
           'Description' => Yii::t('app', 'Description'),
            'open_time' => Yii::t('app', 'Open time'),
            'close_time' => Yii::t('app', 'Close time'),
            'address' => Yii::t('app', 'Address'),
            'phone_no1' => Yii::t('app', 'Phone No1'),
            'phone_no2' => Yii::t('app', 'Phone No2'),
            'latitude' => Yii::t('app', 'Latitude'),
            'longitude' => Yii::t('app', 'Longitude')
        ];
    }
    
     /**
     * Relation
     * @return type
     */
    public function getCities()
    {
        return $this->hasOne(City::className(), ['id' => 'city_id'])->select(['id','name','code']);
    }
    
    
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getImages() {
        $imagePath = \common\models\SiteConfig::getConfigVal('_Image_WebSite_Path');
        return $this->hasMany(UploadedFile::className(), ['reference_id' => 'id'])
                        ->andOnCondition(['reference_type' => 'Services'])->select(['type','filename',"concat('".$imagePath."' , `uploaded_file`.`path`) as 'path'"]);
    }

    public function extraFields() {
        return ['images'];
    }

    public function fields() {
                return [
            'id',
            'type',
            'name' =>'title',
            'Description',
            'open_time',
            'close_time',
            'address',
            'phone_no1',
            'phone_no2',
            'latitude',
            'longitude',
            'images',
            'city' => 'cities'        
        ];

        
        
    }

}
