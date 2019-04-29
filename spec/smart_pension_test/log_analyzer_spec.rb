RSpec.describe SmartPensionTest::LogAnalyzer do
  let(:parsed_log_data) { [] }
  let(:log_analyzer) { described_class.new(parsed_log_data) }

  it 'takes parsed log file as an initialize argument' do
    described_class.new([])
  end

  describe '#most_page_views' do
    let(:most_page_views) { log_analyzer.most_page_views }

    it 'is an collection' do
      expect(most_page_views).to be_kind_of Enumerable
    end

    context 'log contains one item' do
      let(:parsed_log_data) { [double('LogItem', path: 'a', ip_address: 1)] }

      it 'contains one item with path a and visit count 1' do
        expect(most_page_views).to match([path: 'a', visit_count: 1])
      end
    end

    context 'when log contains two different items' do
      let(:parsed_log_data) do
        [
          double('LogItem', path: 'b', ip_address: '2'),
          double('LogItem', path: 'a', ip_address: '1')
        ]
      end

      it 'has two items with different path and visit count = 1' do
        expect(most_page_views).to match(
          [
            { path: "a", visit_count: 1 },
            { path: "b", visit_count: 1 }
          ]
        )
      end
    end

    context 'when log contains two items with same path' do
      let(:parsed_log_data) do
        [
          double('LogItem', path: 'a', ip_address: '1'),
          double('LogItem', path: 'a', ip_address: '2')
        ]
      end

      it 'has one item with path "a" and visit count 2' do
        expect(most_page_views).to match([{ path: "a", visit_count: 2 }])
      end
    end

    context 'log contains two same url items and one different' do
      let(:parsed_log_data) do
        [
          double('LogItem', path: 'b', ip_address: '2'),
          double('LogItem', path: 'a', ip_address: '1'),
          double('LogItem', path: 'a', ip_address: '2')
        ]
      end

      it 'has two sorted items by visit count' do
        expect(most_page_views).to match(
          [
            { path: "a", visit_count: 2 },
            { path: "b", visit_count: 1 }
          ]
        )
      end
    end
  end

  describe '#most_unique_page_views' do
    subject(:most_unique_page_views) { log_analyzer.most_unique_page_views }

    it 'is a collection' do
      expect(most_unique_page_views).to be_kind_of Enumerable
    end

    context 'when log contains one item' do
      let(:parsed_log_data) { [double('LogItem', path: 'a', ip_address: 1)] }

      it 'has one item with visit count 1' do
        expect(most_unique_page_views).to match([path: 'a', visit_count: 1])
      end
    end

    context 'when log contains two different items' do
      let(:parsed_log_data) do
        [
          double('LogItem', path: 'a', ip_address: '1'),
          double('LogItem', path: 'b', ip_address: '2')
        ]
      end

      it 'has two items each with visit count 1' do
        expect(most_unique_page_views).to match(
          [
            { path: "b", visit_count: 1 },
            { path: "a", visit_count: 1 }
          ]
        )
      end
    end

    context 'when log contains two items with same path but different ip' do
      let(:parsed_log_data) do
        [
          double('LogItem', path: 'a', ip_address: '1'),
          double('LogItem', path: 'a', ip_address: '2')
        ]
      end

      it 'has one item with visit count 2' do
        expect(most_unique_page_views).to match([{ path: "a", visit_count: 2 }])
      end
    end

    context 'when log contains two same items' do
      let(:parsed_log_data) do
        [
          double('LogItem', path: 'a', ip_address: '1'),
          double('LogItem', path: 'a', ip_address: '1')
        ]
      end

      it 'has one item' do
        expect(most_unique_page_views).to match([{ path: "a", visit_count: 1 }])
      end
    end

    context 'log contains two items with same path and different ip address and two with same path but different ip address' do
      let(:parsed_log_data) do
        [
          double('LogItem', path: 'b', ip_address: '1'),
          double('LogItem', path: 'b', ip_address: '1'),
          double('LogItem', path: 'a', ip_address: '2'),
          double('LogItem', path: 'a', ip_address: '1')
        ]
      end

      it 'has two sorted items by visit count' do
        expect(most_unique_page_views).to match(
          [
            { path: 'a', visit_count: 2 },
            { path: 'b', visit_count: 1 }
          ]
        )
      end
    end
  end

end
