<?php

namespace backend\models;

use Yii;
use \yii\behaviors\TimestampBehavior;
use \yii\db\ActiveRecord;



/**
 * This is the model class for table "customer".
 *
 * @property integer $id
 * @property string $name
 * @property string $itinerary_id
 * @property string $mobile_no
 * @property string $email
 * @property string $day_description
 * @property string $created_at
 * @property string $updated_at
 */
class Customer extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'customer';
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
            [['name', 'itinerary_id', 'mobile_no','email'], 'required'],
            [['day_description'], 'safe'],
            [['created_at', 'updated_at'], 'safe'],
            [['name', 'email'], 'string', 'max' => 100],
            [['itinerary_id'], 'string', 'max' => 26],
            [['mobile_no'], 'integer'],
            [['email'], 'email'],
            [['itinerary_id', 'mobile_no'], 'unique', 'targetAttribute' => ['itinerary_id', 'mobile_no']]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'itinerary_id' => Yii::t('app', 'Itinerary ID'),
            'mobile_no' => Yii::t('app', 'Mobile No'),
            'email' => Yii::t('app', 'Email'),
            'day_description' => Yii::t('app', 'Day Description'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
