var React = require('react');
var FontA_ = require('react-fontawesome');

module.exports = React.createClass({
  render: function() {
    return (
      <a href='#'>
        <div className='widget internet'>
          <h1>Internet</h1>
          <div className='center'>
            <FontA_ className='large-icon' name='wifi'
            style={{ color: 'white' }} />
          </div>
        </div>
      </a>
    );
  }
})
