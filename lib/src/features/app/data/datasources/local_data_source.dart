class LocalDataSource {
  Future<void> CraeteDataBase() async {}
}

class LocalDataSourceImp implements LocalDataSource{
  @override
  Future<void> CraeteDataBase() async {
    print ("hello world");
  }

}