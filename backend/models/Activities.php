<?php

namespace backend\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use \yii\db\ActiveRecord;

/**
 * This is the model class for table "activities".
 *
 * @property integer $id
 * @property integer $site_seen_id
 * @property string $name
 * @property string $valid_from
 * @property string $valid_to
 * @property double $retail_price
 * @property double $discounted_price
 * @property string $created_at
 * @property string $updated_at
 */
class Activities extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activities';
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
            [['site_seen_id', 'name', 'valid_from', 'valid_to', 'retail_price', 'discounted_price'], 'required'],
            [['site_seen_id'], 'integer'],
            [['valid_from', 'valid_to', 'created_at', 'updated_at'], 'safe'],
            [['retail_price', 'discounted_price'], 'number'],
            [['name'], 'string', 'max' => 1024]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'site_seen_id' => Yii::t('app', 'Site Seen ID'),
            'name' => Yii::t('app', 'Name'),
            'valid_from' => Yii::t('app', 'Valid From'),
            'valid_to' => Yii::t('app', 'Valid To'),
            'retail_price' => Yii::t('app', 'Retail Price'),
            'discounted_price' => Yii::t('app', 'Discounted Price'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
