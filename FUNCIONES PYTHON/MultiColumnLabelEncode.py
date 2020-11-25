from sklearn.preprocessing import LabelEncoder


class MultiColumnLabelEncoder:
       def __init__(self,columns = None):
           self.columns = columns # array of column names to encode

       def fit(self,X,y=None):
           return self # not relevant here

       def transform(self,X):
           '''
           Transforms columns of X specified in self.columns using
           LabelEncoder(). If no columns specified, transforms all
           columns in X.
           '''
           output = X.copy()
           if self.columns is not None:
               for col in self.columns:
                   output[col] = LabelEncoder().fit_transform(output[col])
           else:
               for colname,col in output.iteritems():
                   output[colname] = LabelEncoder().fit_transform(col)
           return output

       def fit_transform(self,X,y=None):
           return self.fit(X,y).transform(X)




# Transformamos el datafrema df para las columnas que sean string los convierta a números:
#encoding_pipeline = Pipeline([
       #('encoding',MultiColumnLabelEncoder(columns=['2','4','6','7','8','12','13','15','17']))
       # add more pipeline steps as needed
#])
#df_transformacion = encoding_pipeline.fit_transform(df)
#df_transformacion