import mysql.connector
from tabulate import tabulate

class DatabaseConnector:
    def __init__(self, host, user, password, database):
        self.host = host
        self.user = user
        self.password = password
        self.database = database
        self.connection = None
        self.cursor = None

    def connect(self):
        try:
            self.connection = mysql.connector.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.database
            )
            self.cursor = self.connection.cursor()
            print("Conexión establecida a la base de datos")
        except mysql.connector.Error as e:
            print(f"Error al conectar a la base de datos: {e}")

    def disconnect(self):
        if self.connection:
            self.connection.close()
            print("Conexión cerrada")

    def execute_stored_procedure(self, procedure_name):
        try:
            self.cursor.callproc(procedure_name)
            for result in self.cursor.stored_results():
                rows = result.fetchall()
                if rows:
                    headers = [i[0] for i in result.description]
                    print(tabulate(rows, headers=headers, tablefmt="pretty"))
                else:
                    print("No se encontraron resultados")
        except mysql.connector.Error as e:
            print(f"Error al ejecutar procedimiento almacenado: {e}")

    def execute_insert_procedure(self, procedure_name, *args):
        try:
            self.cursor.callproc(procedure_name, args)
            self.connection.commit()
            print("Datos insertados correctamente")
        except mysql.connector.Error as e:
            self.connection.rollback()
            print(f"Error al insertar datos: {e}")

user = 'root'
password = ''
host = 'localhost'
database = 'search_food'

db_connector = DatabaseConnector(host, user, password, database)
db_connector.connect()

print("Mostrando detalles de todos los productos:")
db_connector.execute_stored_procedure('Detalleproducto')

print("\nInsertando un nuevo producto:")
db_connector.execute_insert_procedure('Insertarproducto', 1, 'leche de vaca', 'leche de vaca conservada en botella', '2024-08-02', '2024-09-05', '2024089')

print("\nMostrando detalles de todos los productos después de la inserción:")
db_connector.execute_stored_procedure('Detalleproducto')

db_connector.disconnect()