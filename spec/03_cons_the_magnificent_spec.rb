require 'spec_helper'

describe 'a little Scheme' do
  context 'according to chapter three of The Little Schemer' do
    include SemanticsMatchers

    describe '(rember a lat)' do
      it { is_expected.to evaluate_to('(lamb chops and jelly)').where a: 'mint', lat: '(lamb chops and mint jelly)' }
      it { is_expected.to evaluate_to('(lamb chops and flavored mint jelly)').where a: 'mint', lat: '(lamb chops and mint flavored mint jelly)' }
      it { is_expected.to evaluate_to('(bacon lettuce and tomato)').where a: 'toast', lat: '(bacon lettuce and tomato)' }
      it { is_expected.to evaluate_to('(coffee tea cup and hick cup)').where a: 'cup', lat: '(coffee cup tea cup and hick cup)' }
      it { is_expected.to evaluate_to('(bacon lettuce tomato)').where a: 'and', lat: '(bacon lettuce and tomato)' }
      it { is_expected.to evaluate_to('(soy and tomato sauce)').where a: 'sauce', lat: '(soy sauce and tomato sauce)' }
    end

    describe '(firsts l)' do
      it { is_expected.to evaluate_to('(apple plum grape bean)').where l: '((apple peach pumpkin) (plum pear cherry) (grape raisin pea) (bean carrot eggplant))' }
      it { is_expected.to evaluate_to('(a c e)').where l: '((a b) (c d) (e f))' }
      it { is_expected.to evaluate_to('()').where l: '()' }
      it { is_expected.to evaluate_to('(five four eleven)').where l: '((five plums) (four) (eleven green oranges))' }
      it { is_expected.to evaluate_to('((five plums) eleven (no))').where l: '(((five plums) four) (eleven green oranges) ((no) more))' }
    end

    describe '(insertR new old lat)' do
      it { is_expected.to evaluate_to('(ice cream with fudge topping for dessert)').where new: 'topping', old: 'fudge', lat: '(ice cream with fudge for dessert)' }
      it { is_expected.to evaluate_to('(tacos tamales and jalapeño salsa)').where new: 'jalapeño', old: 'and', lat: '(tacos tamales and salsa)' }
      it { is_expected.to evaluate_to('(a b c d e f g d h)').where new: 'e', old: 'd', lat: '(a b c d f g d h)' }
    end

    # The book doesn't test insertL, but we will.
    specify { expect('(insertL new old lat)').to evaluate_to('(a b c d e f g d h)').where new: 'c', old: 'd', lat: '(a b d e f g d h)' }

    specify { expect('(subst new old lat)').to evaluate_to('(ice cream with topping for dessert)').where new: 'topping', old: 'fudge', lat: '(ice cream with fudge for dessert)' }

    specify { expect('(subst2 new o1 o2 lat)').to evaluate_to('(vanilla ice cream with chocolate topping)').where new: 'vanilla', o1: 'chocolate', o2: 'banana', lat: '(banana ice cream with chocolate topping)' }

    specify { expect('(multirember a lat)').to evaluate_to('(coffee tea and hick)').where a: 'cup', lat: '(coffee cup tea cup and hick cup)' }

    # The book doesn't test multiinsertR, but we will.
    specify { expect('(multiinsertR new old lat)').to evaluate_to('(a b c d e f g d e h)').where new: 'e', old: 'd', lat: '(a b c d f g d h)' }

    specify { expect('(multiinsertL new old lat)').to evaluate_to('(chips and fried fish or fried fish and fried)').where new: 'fried', old: 'fish', lat: '(chips and fish or fish and fried)' }

    # The book doesn't test multisubst, but we will.
    specify { expect('(multisubst new old lat)').to evaluate_to('(topping ice cream with topping for dessert)').where new: 'topping', old: 'fudge', lat: '(fudge ice cream with fudge for dessert)' }
  end
end
