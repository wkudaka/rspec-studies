describe 'Expectation Matchers' do

	describe 'equivalence matchers' do

    """
    reading from:
    http://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/equality-matchers

    I undestand that:
    """

    it 'will match loose equality with #eq method' do
      a = "some string here"
      b = "some string here"

      expect(a).to eq(b)
      expect(a).to be == b

      n1 = 100
      n2 = 100.0

      expect(n1).to eq(n2)
    end

    it 'will match value equality with #eql method' do
      a = "some string here"
      b = "some string here"

      expect(a).to eql(b)

      n1 = 100
      n2 = 100.0

      expect(n1).not_to eql(n2)

    end

    it 'will match identity equality with #equal method' do

      a = "some string here"
      b = "some string here"

      expect(a).not_to equal(b)   

      some_other_string = a

      expect(a).to equal(some_other_string)

    end
  end

  describe "truthiness matchers" do

    """
    reading from:
    http://www.relishapp.com/rspec/rspec-expectations/v/3-2/docs/built-in-matchers/be-matchers

    I undestand that:
    """

    it "will match be with true or false" do
      expect(100 < 200).to be(true)
      expect(100 > 200).to be(false)
      expect("some string lalalala o/").not_to be(true) 
      expect(nil).not_to be(false)
      expect(0).not_to be(false)
    end

    it "will match with thruth or falsey" do

      expect(100 < 200).to be_truthy
      expect(100 > 200).to be_falsey
      expect("some string lalalala o/").to be_truthy #different result from be(true) method in the 'it' above
      expect(nil).to be_falsey #different result from be(false) in the 'it' above
      expect(0).not_to be_falsey

    end

  end

  describe "numeric comparison matchers" do
    """
    reading from:
    http://www.relishapp.com/rspec/rspec-expectations/v/3-2/docs/built-in-matchers/comparison-matchers

    I understand that:
    """

    it 'will match less than or greater than' do
      expect(3).to be > 2
      expect(3).to be >= 3
      expect(3).to be <= 3
      expect(2).to be < 3
    end

  end


  describe "collection matchers" do
    """
    reading from:
    http://www.relishapp.com/rspec/rspec-expectations/v/3-2/docs/built-in-matchers/include-matcher
    https://www.relishapp.com/rspec/rspec-rails/docs/matchers/activerecord-relation-match-array
    https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/contain-exactly-matcher
    """

    it "will match arrays" do
      arr = [10, 20, 30, 40, 50]

      expect(arr).to match_array([20,30,40,10,50])
      expect(arr).not_to match_array([10, 20, 40, 50])
      
      expect(arr).to contain_exactly(20,30,10,40,50)
      expect(arr).not_to contain_exactly(10,40,50)

      expect(arr).to include(10)
      expect(arr).to include(10,30,20)
    end

    it "will match strings" do
      str = 'some string here'

      expect(str).to include('here')
      expect(str).to include('som', 'str', 'ere')
    end

    it "will match objects" do
      obj = {:some => 1, :att_that => 2, :i_dont_know => 3}

      expect(obj).to include(:some)
      expect(obj).to include(:some => 1)

      expect(obj).to include(:some, :att_that)
      expect(obj).to include({:some => 1}, {:att_that => 2, :i_dont_know => 3})

      #string does not include....
      expect(obj).not_to include('some')

    end

    it "will match array with objects" do
    
      obj1 = {:some => 1, :att_that => 2, :i_dont_know => 3}
      obj2 = {:i_m_lazy_now =>1}
      obj3 = {:i_m_lazy_now_2 =>2}
      arr = [obj1, obj2, obj3]

      expect(arr).to include({:i_m_lazy_now => 1})

      #omg next time i create less variables
      expect(arr).to match_array([
        {:i_m_lazy_now =>1}, 
        {:i_m_lazy_now_2 =>2}, 
        {:some => 1, :att_that => 2, :i_dont_know => 3}, 
      ])


    end


  end

end