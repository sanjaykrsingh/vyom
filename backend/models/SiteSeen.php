<?php

namespace backend\models;

use Yii;

use \yii\behaviors\TimestampBehavior;
use \yii\db\ActiveRecord;

/**
 * This is the model class for table "site_seen".
 *
 * @property integer $id
 * @property integer $city_id
 * @property string $title
 * @property string $Description
 * @property string $open_time
 * @property string $close_time
 * @property string $address
 * @property string $phone_no1
 * @property string $phone_no2
 * @property string $email
 * @property string $latitude
 * @property string $longitude
 * @property string $created_at
 * @property string $updated_at
 */
class SiteSeen extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'site_seen';
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
            [['city_id', 'title'], 'required'],
            [['city_id'], 'integer'],
            [['email'], 'email'],
            [['created_at', 'updated_at'], 'safe'],
            [['Description'], 'string'],
            [['title'], 'string', 'max' => 1024],
            [['open_time', 'close_time'], 'string', 'max' => 50],
            [['address', 'email'], 'string', 'max' => 100],
            [['phone_no1', 'phone_no2'], 'string', 'max' => 11],
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
            'city_id' => Yii::t('app', 'City ID'),
            'title' => Yii::t('app', 'name'),
            'Description' => Yii::t('app', 'Description'),
            'open_time' => Yii::t('app', 'Open Time'),
            'close_time' => Yii::t('app', 'Close Time'),
            'address' => Yii::t('app', 'Address'),
            'phone_no1' => Yii::t('app', 'Phone No1'),
            'phone_no2' => Yii::t('app', 'Phone No2'),
            'email' => Yii::t('app', 'Email'),
            'latitude' => Yii::t('app', 'Latitude'),
            'longitude' => Yii::t('app', 'Longitude'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
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
                        ->andOnCondition(['reference_type' => 'SiteSeen'])->select(['type','filename',"concat('".$imagePath."' , `uploaded_file`.`path`) as 'path'"]);
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActivities() {
        return $this->hasMany(Activities::className(), ['site_seen_id' => 'id'])->select(['id','name','valid_from','valid_to','retail_price','discounted_price']);
    }

    public function extraFields() {
        return ['images'];
    }

    public function fields() {
                return [
            'id',
            'name' =>'title',
            'Description',
            'email',        
            'open_time',
            'close_time',
            'address',
            'phone_no1',
            'phone_no2',
            'latitude',
            'longitude',
            'images',
            'city' => 'cities',
            'activities'        
        ];
    }

}
