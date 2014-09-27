require 'spec_helper'
require 'activerecord/attr/stripper'

class Post < ActiveRecord::Base
  include ActiveRecord::Attr::Stripper
end

describe ActiveRecord::Attr::Stripper do
  TEST_VALUE = ' 　test 　'

  let(:post) { Post.new(title: TEST_VALUE, description: TEST_VALUE) }

  context 'when Post has .strip_attrs(:title)' do
    before do
      Post.class_eval do
        strip_attrs :title
      end
    end

    context 'without options' do
      context 'when attr includes blank' do
        before do
          post.valid?
        end

        it { expect(post.title).to eq '　test 　' }
        it { expect(post.description).to eq TEST_VALUE }
      end

      context 'when attr includes only blank' do
        before do
          post.title = '  '
          post.valid?
        end

        it { expect(post.title).to eq '' }
        it { expect(post.description).to eq TEST_VALUE }
      end
    end

    context 'with options' do
      describe ':zenkaku' do
        before do
          Post.class_eval do
            strip_attrs :title, zenkaku: true
          end
        end

        context 'when attr includes blank' do
          before do
            post.valid?
          end

          it { expect(post.title).to eq 'test' }
          it { expect(post.description).to eq TEST_VALUE }
        end

        context 'when attr includes only blank' do
          before do
            post.title = ' 　　 '
            post.valid?
          end

          it { expect(post.title).to eq '' }
          it { expect(post.description).to eq TEST_VALUE }
        end
      end

      describe ':blank_to_nil' do
        before do
          Post.class_eval do
            strip_attrs :title, zenkaku: true, blank_to_nil: true
          end
        end

        context 'when attr includes only blank' do
          before do
            post.title = ' 　　 '
            post.valid?
          end

          it { expect(post.title).to be_nil }
          it { expect(post.description).to eq TEST_VALUE }
        end
      end
    end
  end
end
