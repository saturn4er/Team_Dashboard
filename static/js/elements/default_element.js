// Generated by CoffeeScript 1.9.1
(function() {
  var uml_block_class,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  uml_block_class = 'uml_block';

  this.DefaultElement = (function(superClass) {
    extend(DefaultElement, superClass);

    function DefaultElement(board, block_type, params1, hash) {
      this.board = board;
      this.block_type = block_type;
      this.params = params1;
      this.hash = hash;
      if (!this.hash) {
        this.hash = Math.random().toString(36).substr(2, 15);
      }
      this.save();
    }

    DefaultElement.prototype.get_hash = function() {
      return this.hash;
    };

    DefaultElement.prototype.redraw = function() {
      return this.emit('redraw');
    };

    DefaultElement.prototype.save = function() {
      this.emit('beforeSave');
      return socket.emit('saveElement', this.hash, {
        type: this.block_type,
        params: this.params
      });
    };

    DefaultElement.prototype.update = function(params) {
      var i, key, len, val;
      for (val = i = 0, len = params.length; i < len; val = ++i) {
        key = params[val];
        this.params[key] = val;
      }
      return this.redraw();
    };

    return DefaultElement;

  })(EventEmitter);

}).call(this);

//# sourceMappingURL=default_element.js.map
