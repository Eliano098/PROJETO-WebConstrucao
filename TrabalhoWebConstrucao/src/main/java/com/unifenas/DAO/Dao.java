package com.unifenas.DAO;

import java.util.List;

public interface Dao<T> {///Tipo Generico
	  //Operações de Crud
      T get(int id);
      
      List<T>getAll();
      
      List<T>getAllWhere(int id);
      
      void save(T objeto);
      
      void update(T objeto);
      
      void delete (T objeto);
}
