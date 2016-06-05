<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\SiteSeen;

/**
 * SiteSeenSearch represents the model behind the search form about `backend\models\SiteSeen`.
 */
class SiteSeenSearch extends SiteSeen
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'city_id'], 'integer'],
            [['title', 'Description', 'open_time', 'close_time', 'address1', 'address2', 'phone_no1', 'phone_no2', 'email', 'latitude', 'longitude', 'created_at', 'updated_at'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = SiteSeen::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);
        
         $query->joinWith(['cities']); 
        
        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'city_id' => $this->city_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'Description', $this->Description])
            ->andFilterWhere(['like', 'open_time', $this->open_time])
            ->andFilterWhere(['like', 'close_time', $this->close_time])
            ->andFilterWhere(['like', 'address1', $this->address1])
            ->andFilterWhere(['like', 'address2', $this->address2])
            ->andFilterWhere(['like', 'phone_no1', $this->phone_no1])
            ->andFilterWhere(['like', 'phone_no2', $this->phone_no2])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'latitude', $this->latitude])
            ->andFilterWhere(['like', 'longitude', $this->longitude]);

        return $dataProvider;
    }
}
