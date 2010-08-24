require 'spec_helper'

describe NumericArray do
  describe ["1", 2.52, "foo", :bar, "-1.25e45" ] do
    let(:array) { ["1", 2.52, "foo", :bar, "-1.25e45" ] }    
    it { should_not be_numeric }
    it { should_not be_a_numeric_array }
    its(:numerify!) { lambda{ array.numerify! }.should raise_error(ArgumentError) }
    its(:sum) { lambda{ array.sum }.should raise_error(ArgumentError) }
    its(:avg) { lambda{ array.avg }.should raise_error(ArgumentError) }
    its(:variance) { lambda{ array.variance }.should raise_error(ArgumentError) }
    its(:std_dev) { lambda{ array.std_dev }.should raise_error(ArgumentError) }
  end
  
  describe [1, 2.52, -8.65, 20/50.0] do
    let(:array) { [1, 2.52, -8.65, 20/50.0] }
    it { should be_numeric }
    it { should be_a_numeric_array }
    its(:sum) { should == -4.73 }
    its(:mean) { should == -1.1825 }
    its(:variance) { array.variance.round(5).should == 19.18492 }
    its(:std_dev) { array.std_dev.round(5).should == 4.38006 }
    its(:sample_variance) { array.sample_variance.round(5).should == 25.57989 }
    its(:sample_std_dev) { array.sample_std_dev.round(5).should == 5.05766 }
  end
  
  describe ["1", 2.52, -8.65, "4e-1"] do
    let(:array) { ["1", 2.52, -8.65, "4e-1"] }
    its(:numerify!) { should == [1, 2.52, -8.65, 0.4] }
    it { should be_numeric }
    it { should be_a_numeric_array }
    its(:sum) { should == -4.73 }
    its(:mean) { should == -1.1825 }
    its(:variance) { array.variance.round(5).should == 19.18492 }
    its(:std_dev) { array.std_dev.round(5).should == 4.38006 }
    its(:sample_variance) { array.sample_variance.round(5).should == 25.57989 }
    its(:sample_std_dev) { array.sample_std_dev.round(5).should == 5.05766 }
  end
end