import 'package:fwc_album_app/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';

import '../../../models/groups_stickers.dart';
import './my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  final StickersRepository stickersRepository;
  late final MyStickersView _view;

  var album = <GroupsStickers>[];
  var statusSelected = 'all';
  List<String>? countries;

  MyStickersPresenterImpl({
    required this.stickersRepository,
  });

  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    _view.loadedPage([...album]);
  }

  @override
  set view(MyStickersView view) => _view = view;

  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if (countries == null) {
      //* Atualizar a tela com todos os grupos
      _view.updateAlbum(album);
    } else {
      //* Atualizar a tela filtrando os grupos selecionados
      //* Ex: Filtro passado [BRA,POR] - Verifica se existe o BRA em countries
      //* Verifica se existe o POR em countries
      //* Retorna uma nova lista [...album]
      final albumFilter = [...album.where((element) => countries.contains(element.countryCode))];
      _view.updateAlbum(albumFilter);
    }
  }
}
