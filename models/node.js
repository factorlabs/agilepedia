var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var nodeSchema = new Schema({
  name: String,
  body: String,
  authorEmail: String,
  authorName: String,
  created_at: Date,
  updated_at: Date
});

var Node = mongoose.model('Node', nodeSchema);

module.exports = Node;