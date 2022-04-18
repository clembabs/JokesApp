// /// Interface for Network Manager
// abstract class INetworkManager {
//   /// Future that returns true if there is internet connection
//   Future<bool> get isConnected;
// }

// class NetworkManager implements INetworkManager {
//   ///NetworkManager recive a connection Checker
//   NetworkManager(this.connectionChecker);

//   /// Access to connectionChecker properties
//   final DataConnectionChecker connectionChecker;

//   @override
//   Future<bool> get isConnected => connectionChecker.hasConnection;
// }