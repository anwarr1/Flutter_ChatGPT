class Chat {
  String? message;
  int? chatIndex;
  Chat({required this.message, required this.chatIndex});
  Chat.fromJson(Map<String, dynamic> conver) {
    message = conver['message'];
    chatIndex = conver['chatIndex'];
  }
}