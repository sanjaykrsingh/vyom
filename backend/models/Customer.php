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
 * @property string $username
 * @property string $mobile_no
 * @property string $password_hash
 * @property string $email
 * @property string $day_description
 * @property string $type
 * @property string $created_at
 * @property string $updated_at
 */
class Customer extends \yii\db\ActiveRecord
{
     const STATUS_DELETED = 0;
    const STATUS_ACTIVE = 10;
    
    public $password;
    
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user}}';
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
            [['name', 'username', 'mobile_no'], 'required'],
            [['day_description','type'], 'safe'],
            [['created_at', 'updated_at'], 'safe'],
            [['name', 'email'], 'string', 'max' => 100],
            [['username'], 'string', 'max' => 26],
            [['mobile_no'], 'string'],
            [['email'], 'email'],
            [['username'], 'unique']
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
            'username' => Yii::t('app', 'Itinerary ID'),
            'password_hash' => Yii::t('app', 'Password'),
            'mobile_no' => Yii::t('app', 'Mobile No'),
            'email' => Yii::t('app', 'Email'),
            'day_description' => Yii::t('app', 'Day Description'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
    
    
     /**
     * create user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function createCustomer()
    {
        if ($this->validate()) {
            if(!empty($this->password)){
                $this->setPassword($this->password);
                $this->generateAuthKey();
            }else{
                $this->setPassword($this->mobile_no);
            }
            $this->type = 'customer';
            if ($this->save()) {
                return $this;
            }
        }

        return null;
    }
    
    public function beforeSave($insert) {
            if (parent::beforeSave($insert)) {
            if ($this->isNewRecord) {
                $this->status = self::STATUS_ACTIVE;
                $this->type = 'customer';
                $this->auth_key = Yii::$app->getSecurity()->generateRandomString();
            }
            return true;
        }
       
        return false;
    }
    
    
    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }
    
    public function fields() {
                return [
            'name',
            'itineraryId'=>'username',
            'email',
            'day_description'
        ];
    }
    
}
