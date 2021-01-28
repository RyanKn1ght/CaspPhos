

from deepphos import predict
#predict.predict_for_deepphos("test data.csv", "S,T", predictFrame = "general")

train_file_name = 'test data.csv'
site = 'S', 'T'
predict.predict_for_deepphos(train_file_name, site, predictFrame='kinase', hierarchy='group', kinase='AGC')