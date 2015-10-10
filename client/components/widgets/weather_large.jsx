var React = require('react');
var FontA_ = require('react-fontawesome');

module.exports = React.createClass({
  getInitialState: function() {
    return {data: []};
  },

  componentDidMount: function() {
    if (this.isMounted()) {
      alert('hello')
    }
  },

  render: function() {
    return (
      <div className='widget large weather'>
        <h1>Weather</h1>
      </div>
    );
  }
})
