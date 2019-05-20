<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product_review".
 *
 * @property int $id
 * @property string $date
 * @property string $username
 * @property string $user_email
 * @property string $review_text
 */
class review extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_review';
    }


    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['date', 'username', 'user_email', 'review_text'], 'required'],
            [['date'], 'safe'],
            [['review_text'], 'string'],
            [['username'], 'string', 'max' => 256],
            [['user_email'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'date' => 'Date',
            'username' => 'Username',
            'user_email' => 'User Email',
            'review_text' => 'Review Text',
        ];
    }
}
