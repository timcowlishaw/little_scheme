require 'spec_helper'

describe 'a little Scheme' do
  context 'according to chapter five of The Little Schemer' do
    include SemanticsMatchers

    describe '(rember* a l)' do
      it { is_expected.to evaluate_to('((coffee) ((tea)) (and (hick)))').where a: 'cup', l: '((coffee) cup ((tea) cup) (and (hick)) cup)' }
      it { is_expected.to evaluate_to('(((tomato)) ((bean)) (and ((flying))))').where a: 'sauce', l: '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce))' }
    end

    specify { expect('(lat? l)').to evaluate_to('#f').where l: '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce))' }
    specify { expect('(car l)').not_to evaluate_to_an_atom.where l: '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce))' }

    specify { expect('(insertR* new old l)').to evaluate_to('((how much (wood)) could ((a (wood) chuck roast)) (((chuck roast))) (if (a) ((wood chuck roast))) could chuck roast wood)').where new: 'roast', old: 'chuck', l: '((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood)' }

    specify { expect('(occur* a l)').to evaluate_to('5').where a: 'banana', l: '((banana) (split ((((banana ice))) (cream (banana)) sherbet)) (banana) (bread) (banana brandy))' }

    specify { expect('(subst* new old l)').to evaluate_to('((orange) (split ((((orange ice))) (cream (orange)) sherbet)) (orange) (bread) (orange brandy))').where new: 'orange', old: 'banana', l: '((banana) (split ((((banana ice))) (cream (banana)) sherbet)) (banana) (bread) (banana brandy))' }

    specify { expect('(insertL* new old l)').to evaluate_to('((how much (wood)) could ((a (wood) pecker chuck)) (((pecker chuck))) (if (a) ((wood pecker chuck))) could pecker chuck wood)').where new: 'pecker', old: 'chuck', l: '((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood)' }

    specify { expect('(member* a l)').to evaluate_to('#t').where a: 'chips', l: '((potato) (chips ((with) fish) (chips)))' }

    describe '(leftmost l)' do
      it { is_expected.to evaluate_to('potato').where l: '((potato) (chips ((with) fish) (chips)))' }
      it { is_expected.to evaluate_to('hot').where l: '(((hot) (tuna (and))) cheese)' }
      it { is_expected.to evaluate_to_nothing.where l: '(((() four)) 17 (seventeen))' }
    end

    specify { expect('(leftmost (quote ()))').to evaluate_to_nothing }

    describe '(and (atom? (car l)) (eq? (car l) x))' do
      it { is_expected.to evaluate_to('#f').where x: 'pizza', l: '(mozzarella pizza)' }
      it { is_expected.to evaluate_to('#f').where x: 'pizza', l: '((mozzarella mushroom) pizza)' }
      it { is_expected.to evaluate_to('#t').where x: 'pizza', l: '(pizza (tastes good))' }
    end

    describe '(eqlist? l1 l2)' do
      it { is_expected.to evaluate_to('#t').where l1: '(strawberry ice cream)', l2: '(strawberry ice cream)' }
      it { is_expected.to evaluate_to('#f').where l1: '(strawberry ice cream)', l2: '(strawberry cream ice)' }
      it { is_expected.to evaluate_to('#f').where l1: '(banana ((split)))', l2: '((banana) (split))' }
      it { is_expected.to evaluate_to('#f').where l1: '(beef ((sausage)) (and (soda)))', l2: '(beef ((salami)) (and (soda)))' }
      it { is_expected.to evaluate_to('#t').where l1: '(beef ((sausage)) (and (soda)))', l2: '(beef ((sausage)) (and (soda)))' }
    end
  end
end
