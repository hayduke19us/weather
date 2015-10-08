var __path__ = '../../client/components/widgets/internet.jsx'
jest.dontMock(__path__)

var React = require('react'),
    ReactDom = require('react-dom'),
    TestUtils = require('react-addons-test-utils')

var Internet = require(__path__),
    weather_widget = TestUtils.renderIntoDocument(<Internet/>),
    widget = TestUtils.findRenderedDOMComponentWithClass(weather_widget,
                                                         'widget internet')
describe('Internet', function(){
  it('has a class of widget internet', function() {
    expect(ReactDom.findDOMNode(widget).className).toEqual('widget internet')
  });
});
