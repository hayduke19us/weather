var __path__ = '../../client/components/widgets/lights.jsx'
jest.dontMock(__path__)

var React = require('react'),
    ReactDom = require('react-dom'),
    TestUtils = require('react-addons-test-utils')

var Lights = require(__path__),
    lights_widget = TestUtils.renderIntoDocument(<Lights/>),
    widget = TestUtils.findRenderedDOMComponentWithClass(lights_widget, 'widget lg lights')

describe('Lights', function(){
  it('has a class of widget lg lights', function() {
    expect(ReactDom.findDOMNode(widget).className).toEqual('widget lg lights')
  });
});
