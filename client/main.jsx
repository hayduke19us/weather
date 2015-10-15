var Config = require('./config/config.js').load
var React = require('react');
var ReactDom = require('react-dom')
var Router = require('./config/routes.jsx')

var App = require('./components/layout/App.jsx');

require('bootstrap/dist/css/bootstrap.css')
require('./stylesheets/main.scss')

ReactDom.render(React.createElement(Router), document.getElementById('router'));
