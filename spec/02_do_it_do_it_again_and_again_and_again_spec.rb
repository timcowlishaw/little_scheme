require 'spec_helper'

describe 'a little Scheme' do
  context 'according to chapter two of The Little Schemer' do
    include SemanticsMatchers

    describe '(lat? l)' do
      it { is_expected.to be_true.where l: '(Jack sprat could eat no chicken fat)' }
      it { is_expected.to be_false.where l: '((Jack) sprat could eat no chicken fat)' }
      it { is_expected.to be_false.where l: '(Jack (sprat could) eat no chicken fat)' }
      it { is_expected.to be_true.where l: '()' }
      it { is_expected.to evaluate_to('#t').where l: '(bacon and eggs)' }
      it { is_expected.to evaluate_to('#f').where l: '(bacon (and eggs))' }
    end

    specify { expect('(or (null? l1) (atom? l2))').to be_true.where l1: '()', l2: '(d e f g)' }

    describe '(or (null? l1) (null? l2))' do
      it { is_expected.to be_true.where l1: '(a b c)', l2: '()' }
      it { is_expected.to be_false.where l1: '(a b c)', l2: '(atom)' }
    end

    specify { expect('a').to be_a_member_of('lat').where a: 'tea', lat: '(coffee tea or milk)' }

    describe '(member? a lat)' do
      it { is_expected.to be_false.where a: 'poached', lat: '(fried eggs and scrambled eggs)' }
      it { is_expected.to evaluate_to('#t').where a: 'meat', lat: '(mashed potatoes and meat gravy)' }
      it { is_expected.to evaluate_to('#f').where a: 'liver', lat: '(bagels and lox)' }
    end
  end
end
