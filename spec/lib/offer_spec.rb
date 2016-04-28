describe HasOffersV3::Offer do
  let(:url)  { api_url 'Offer' }

  describe '#find_all' do
    it 'makes a proper request call' do
      stub_call
      response = subject.find_all
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'findAll'}))).to have_been_made
      validate_call response
    end
  end

  describe '#find_all_by_ids' do
    it 'makes a proper request call' do
      stub_call
      response = subject.find_all_by_ids ids: [1]
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'findAllByIds'}))).to have_been_made
      validate_call response
    end

    context 'when there is no id' do
      it 'raises exception' do
        expect { subject.find_all_by_ids }.to raise_error ArgumentError
      end
    end
  end

  describe '#find_all_ids_by_advertiser_id' do
    it 'makes a proper request call' do
      stub_call
      response = subject.find_all_ids_by_advertiser_id advertiser_id: 1
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'findAllIdsByAdvertiserId', 'advertiser_id' => '1'}))).to have_been_made
      validate_call response
    end

    context 'when there is no id' do
      it 'raises exception' do
        expect { subject.find_all_ids_by_advertiser_id }.to raise_error ArgumentError
      end
    end
  end

  describe '#find_all_ids_by_affiliate_id' do
    it 'makes a proper request call' do
      stub_call
      response = subject.find_all_ids_by_affiliate_id affiliate_id: 1
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'findAllIdsByAffiliateId', 'affiliate_id' => '1'}))).to have_been_made
    end
  end

  describe '#find_by_id' do
    it 'makes a proper request call' do
      stub_call
      response = subject.find_by_id id: 1
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'findById', 'id' => '1'}))).to have_been_made
      validate_call response
    end

    context 'when there is no id' do
      it 'raises exception' do
        expect { subject.find_by_id }.to raise_error ArgumentError
      end
    end
  end

  describe '#get_groups' do
    it 'makes a proper request call' do
      stub_call
      response = subject.get_groups id: 1
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'getGroups'}))).to have_been_made
      validate_call response
    end

    context 'when there is no id' do
      it 'raises exception' do
        expect { subject.get_groups }.to raise_error ArgumentError
      end
    end
  end

  describe '#get_approved_affiliate_ids' do
    it 'makes a proper API request' do
      stub_call
      response = subject.get_approved_affiliate_ids id: 1
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'getApprovedAffiliateIds'}))).to have_been_made
      validate_call response
    end

    context 'when id parameter is missed' do
      it 'raises an exception' do
        expect { subject.get_approved_affiliate_ids }.to raise_error ArgumentError
      end
    end
  end

  describe '#set_payout' do
    it 'makes a proper request call' do
      stub_call
      response = subject.set_payout id: 1, affiliate_id: 321
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'setPayout'}))).to have_been_made
      validate_call response
    end

    context 'when the id and/or affiliate id parameters are missing' do
      it 'raises an exception' do
        expect { subject.set_payout }.to raise_error ArgumentError
      end
    end
  end

  describe '#set_tier_payout' do
    it 'makes a proper request call' do
      stub_call
      response = subject.set_tier_payout id: 1, affiliate_tier_id: 2
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'setTierPayout'}))).to have_been_made
      validate_call response
    end

    context 'when the id and/or affiliate tier id parameters are missing' do
      it 'raises an exception' do
        expect { subject.set_tier_payout }.to raise_error ArgumentError
      end
    end
  end

  describe '#remove_payout' do
    it 'makes a proper request call' do
      stub_call
      response = subject.remove_payout id: 1, affiliate_id: 321
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'removePayout'}))).to have_been_made
      validate_call response
    end

    context 'when the id and/or affiliate id parameters are missing' do
      it 'raises an exception' do
        expect { subject.remove_payout }.to raise_error ArgumentError
      end
    end
  end

  describe '#generate_tracking_link' do
    it 'makes a proper request call' do
      stub_call
      response = subject.generate_tracking_link offer_id: 1, affiliate_id: 123
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'generateTrackingLink','offer_id' => '1',
       'affiliate_id' => '123'}))).to have_been_made
      validate_call response
    end

    context 'when required params are missing' do
      it 'fails without offer_id' do
        expect { subject.generate_tracking_link affiliate_id: 1}.to raise_error ArgumentError
      end
      it 'fails without affiliate_id' do
        expect { subject.generate_tracking_link offer_id: 10 }.to raise_error ArgumentError
      end
    end
  end

  describe '#get_tier_payouts' do
    it 'makes a proper request call' do
      stub_call
      response = subject.get_tier_payouts id: 1
      expect(a_request(:post, url).with(body: hash_including({'Method' => 'getTierPayouts','id' => '1'}))).to have_been_made
      validate_call response
    end

    it 'fails without id' do
      expect { subject.get_tier_payouts }.to raise_error ArgumentError
    end
  end
end
