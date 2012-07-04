require_relative '../../test_helper.rb'
require_relative '../../test_models'

include BackfireRails
module BackfireRails
  class BackfireQueryTest < MiniTest::Spec

    describe BackfireRailsQuery do

      it "has a configurable name field" do
        BackfireQuery.query_name_field.must_equal "name"
      end

      it "has a configurable expression field" do
        BackfireQuery.query_expression_field.must_equal "expression"
      end

      it "has a configurable fact field" do
        BackfireQuery.query_fact_field.must_equal "fact"
      end


      describe "responds to default attributes" do
        before do
          @query = BackfireQuery.new
        end


        it "responds to name" do
          @query.must_respond_to :name
        end

        it "responds to description" do
          @query.must_respond_to :description
        end

        it "responds to expression" do
          @query.must_respond_to :expression
        end

        it "responds to fact" do
          @query.must_respond_to :fact
        end
      end

    end

    describe AltQuery do

      it "has a configurable name field" do
        AltQuery.query_name_field.must_equal "query_name"
      end

      it "has a configurable expression field" do
        AltQuery.query_expression_field.must_equal "query_expression"
      end

      it "has a configurable fact field" do
        AltQuery.query_fact_field.must_equal "target_fact"
      end

      describe "it responds to alternate attribute names" do
        before do
          @alt_query = AltQuery.new
        end

        it "responds to alternate name" do
          @alt_query.must_respond_to :query_name
        end

        it "responds to alternate expression" do
          @alt_query.must_respond_to :query_expression
        end

        it "responds to alternate fact" do
          @alt_query.must_respond_to :target_fact
        end

      end

    end
  end
end
