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
 * @property string $valid_from
 * @property string $valid_to
 * @property double $retail_price
 * @property double $discounted_price
 * @property string $Description
 * @property string $open_time
 * @property string $close_time
 * @property string $address1
 * @property string $address2
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
            [['city_id', 'title', 'address1', 'phone_no1'], 'required'],
            [['city_id'], 'integer'],
            [['email'], 'email'],
            [['valid_from', 'valid_to', 'created_at', 'updated_at'], 'safe'],
            [['retail_price', 'discounted_price'], 'number'],
            [['Description'], 'string'],
            [['title'], 'string', 'max' => 1024],
            [['open_time', 'close_time'], 'string', 'max' => 50],
            [['address1', 'address2', 'email'], 'string', 'max' => 100],
            [['phone_no1', 'phone_no2'], 'string', 'max' => 11],
            [['latitude', 'longitude'], 'number', 'max' => 20]
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
            'valid_from' => Yii::t('app', 'Valid From'),
            'valid_to' => Yii::t('app', 'Valid To'),
            'retail_price' => Yii::t('app', 'Retail Price'),
            'discounted_price' => Yii::t('app', 'Discounted Price'),
            'Description' => Yii::t('app', 'Description'),
            'open_time' => Yii::t('app', 'Open Time'),
            'close_time' => Yii::t('app', 'Close Time'),
            'address1' => Yii::t('app', 'Address1'),
            'address2' => Yii::t('app', 'Address2'),
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
        return $this->hasOne(City::className(), ['id' => 'city_id']);
    }
}
