#Productモデル
-title       :string  
-catchcopy   :text  
-concept     :text  
-user_id     :int  

#Commentモデル
-text        :text  
-product_id  :int  
-user_id     :int  

#Userモデル
-name        :string  
-profile     :text  
-avatar      :text  
-position     :string  
-occupation  :string  
-email       :string  
-password    :string  

#Tagモデル
-name        :string  

#Product_Tagモデル
-product_id  :int  
-tag_id      :int  

#Product_imageモデル
-image       :text  
-status      :int  
-product_id  :int  

#Likeモデル
-user_id     :int  
-product_id  :int  
