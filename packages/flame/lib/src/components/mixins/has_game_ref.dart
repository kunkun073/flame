import '../../../components.dart';
import '../../../game.dart';

mixin HasGameRef<T extends Game> on Component {
  T? _gameRef;

  T get gameRef {
    final ref = _gameRef;
    if (ref == null) {
      throw 'Accessing gameRef before the component was added to the game!';
    }
    return ref;
  }

  bool get hasGameRef => _gameRef != null;

  set gameRef(T? gameRef) {
    _gameRef = gameRef;
    // TODO: need to register this
    children.query<HasGameRef>().forEach((e) => e.gameRef = gameRef);
  }
}
