var React = require('react');
var ReactDom = require('react-dom')

var Router = require('./config/routes.jsx')

var App = require('./components/layout/App.jsx');

require('./stylesheets/main.scss')

ReactDom.render(React.createElement(Router), document.body);
ReactDom.render(<App/>, document.getElementById('main-content'));

