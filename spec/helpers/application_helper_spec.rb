require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HeHelper. For example:
#
# describe HeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do

  describe "render stars" do
    it "has output as img stars" do
      expect(helper.render_stars(4)).to eq( 
        "<img src=\"/assets/black-1774de0537ba955222f115c6672c6b35c68ed1650614a0ae9c024038fcb6d2c1.png\" alt=\"Black 1774de0537ba955222f115c6672c6b35c68ed1650614a0ae9c024038fcb6d2c1\" width=\"20\" height=\"20\" /><img src=\"/assets/black-1774de0537ba955222f115c6672c6b35c68ed1650614a0ae9c024038fcb6d2c1.png\" alt=\"Black 1774de0537ba955222f115c6672c6b35c68ed1650614a0ae9c024038fcb6d2c1\" width=\"20\" height=\"20\" /><img src=\"/assets/black-1774de0537ba955222f115c6672c6b35c68ed1650614a0ae9c024038fcb6d2c1.png\" alt=\"Black 1774de0537ba955222f115c6672c6b35c68ed1650614a0ae9c024038fcb6d2c1\" width=\"20\" height=\"20\" /><img src=\"/assets/black-1774de0537ba955222f115c6672c6b35c68ed1650614a0ae9c024038fcb6d2c1.png\" alt=\"Black 1774de0537ba955222f115c6672c6b35c68ed1650614a0ae9c024038fcb6d2c1\" width=\"20\" height=\"20\" /><img src=\"/assets/gray-250ab083e555ddfb9e325320356b25e7140ee08ac1ea240ba69a0e074d139eb7.png\" alt=\"Gray 250ab083e555ddfb9e325320356b25e7140ee08ac1ea240ba69a0e074d139eb7\" width=\"20\" height=\"20\" />" )
    end
  end

end
