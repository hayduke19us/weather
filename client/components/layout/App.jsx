var React = require('react');
var FontA_ = require('react-fontawesome');

module.exports = React.createClass({
  render: function () {
    return (
        <div id='components'>
          <div id='create_widget'></div>
          <div id='weather'></div>
          <div id='thermo'></div>
          <div id='garden'></div>
          <div id='internet'></div>
          <div id='lights'></div>
        </div>
    );
  }
});
