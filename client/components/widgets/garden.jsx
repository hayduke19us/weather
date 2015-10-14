var React = require('react');
var FontA_ = require('react-fontawesome');

module.exports = React.createClass({
  render: function() {
    return (
      <a href='#'>
        <div className='widget garden'>
          <span className='climacon sun large-icon'/>
          <h5 className='white'>Garden</h5>
        </div>
      </a>
    );
  }
})
