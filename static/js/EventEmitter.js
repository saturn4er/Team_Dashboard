// Generated by CoffeeScript 1.9.1
(function() {
  this.EventEmitter = (function() {
    var events;

    function EventEmitter() {}

    events = {};

    EventEmitter.prototype.emit = function(event) {
      var arg, begin, event_args, evnt, i, j, len, len1, ref;
      if (!events[event]) {
        return;
      }
      event_args = [];
      begin = true;
      for (i = 0, len = arguments.length; i < len; i++) {
        arg = arguments[i];
        if (begin !== true) {
          event_args.push(arg);
        } else {
          begin = false;
        }
      }
      ref = events[event];
      for (j = 0, len1 = ref.length; j < len1; j++) {
        evnt = ref[j];
        evnt.apply(null, event_args);
      }
    };

    EventEmitter.prototype.deleteListener = function(event, func) {
      var index;
      if (!events[event]) {
        return false;
      }
      index = events[event].indexOf(func);
      if (index !== -1) {
        return events[event].splice(index, 1);
      }
    };

    EventEmitter.prototype.on = function(event, func) {
      if (typeof func !== "function") {
        return;
      }
      if (!events[event]) {
        events[event] = [];
      }
      return events[event].push(func);
    };

    return EventEmitter;

  })();

}).call(this);

//# sourceMappingURL=EventEmitter.js.map