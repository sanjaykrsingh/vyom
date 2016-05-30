<?php

namespace backend\models;

use Yii;

use \yii\behaviors\TimestampBehavior;
use \yii\db\ActiveRecord;


/**
 * This is the model class for table "restaurant".
 *
 * @property integer $id
 * @property integer $city_id
 * @property string $type
 * @property string $title
 * @property string $Description
 * @property string $address1
 * @property string $address2
 * @property string $phone_no1
 * @property string $phone_no2
 * @property string $latitude
 * @property string $longitude
 * @property string $created_at
 * @property string $updated_at
 */
class Restaurant extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'restaurant';
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
            [['city_id', 'type', 'title', 'Description', 'address1', 'phone_no1', 'latitude', 'longitude'], 'required'],
            [['city_id'], 'integer'],
            [['type', 'Description'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['title'], 'string', 'max' => 1024],
            [['open_time','close_time','address1', 'address2'], 'string'],
            [['phone_no1', 'phone_no2'], 'integer'],
            [['latitude', 'longitude'], 'integer']
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
            'type' => Yii::t('app', 'Type like(Restaurant, Pub, Night Clubs)'),
            'title' => Yii::t('app', 'Title'),
            'Description' => Yii::t('app', 'Description'),
            'open_time' => Yii::t('app', 'Open time'),
            'close_time' => Yii::t('app', 'Close time'),
            'address1' => Yii::t('app', 'Address1'),
            'address2' => Yii::t('app', 'Address2'),
            'phone_no1' => Yii::t('app', 'Phone No1'),
            'phone_no2' => Yii::t('app', 'Phone No2'),
            'latitude' => Yii::t('app', 'Latitude'),
            'longitude' => Yii::t('app', 'Longitude')
        ];
    }
}