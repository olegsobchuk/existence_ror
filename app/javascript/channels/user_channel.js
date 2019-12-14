import consumer from "./consumer"

consumer.subscriptions.create("UserChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('connection is established')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('channel is disconnected')
  },

  received(data) {
    let klass;
    // Called when there's incoming data on the websocket for this channel
    let userID = data.user_id
    if (data.online == true) {
      klass = 'online'
    } else if (data.online == false) {
      klass = 'offline'
    } else {
      return false;
    }
    $('#user_' + userID).removeClass('online')
    $('#user_' + userID).removeClass('offline')
    $('#user_' + userID).addClass(klass)
  }
});
