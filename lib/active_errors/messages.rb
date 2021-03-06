# frozen_string_literal: true

module ActiveErrors
  class Messages

    attr_reader :errors

    def initialize
      @errors = {}
    end

    def [](key)
      return [] unless key?(key)

      @errors[key]
    end

    def []=(key, value)
      @errors[key] ||= []
      @errors[key] << value
      @errors[key].uniq!
    end

    alias_method :add, :[]=

    def added?(key, val)
      return false unless key?(key)

      @errors[key].include?(val)
    end

    def clear
      @errors.clear
    end

    def delete(key)
      @errors.delete(key)
    end

    # :nocov:
    def each
      @errors.each_key do |key|
        @errors[key].each { |val| yield(key, val) }
      end
    end
    # :nocov:

    def empty?
      @errors.empty?
    end

    alias_method :blank?, :empty?

    def full_message(key, value)
      "#{key} #{value}"
    end

    def full_messages
      @errors.each_with_object([]) do |(key, arr), memo|
        arr.each { |val| memo << full_message(key, val) }
      end
    end

    alias_method :to_a, :full_messages

    def full_messages_for(key)
      return [] unless key?(key)

      @errors[key].map { |val| full_message(key, val) }
    end

    def key?(key)
      @errors.key?(key)
    end

    alias_method :has_key?, :key?
    alias_method :include?, :key?

    def keys
      @errors.keys
    end

    def merge!(hash)
      @errors.merge!(hash) do |_, arr1, arr2|
        arr3 = arr1 + arr2
        arr3.uniq!
        arr3
      end
    end

    def present?
      !blank?
    end

    def size
      @errors.size
    end

    alias_method :count, :size

    def to_hash(full_messages = false)
      return @errors unless full_messages

      @errors.each_with_object({}) do |(key, arr), memo|
        memo[key] = arr.map { |val| full_message(key, val) }
      end
    end

    alias_method :messages, :to_hash
    alias_method :as_json, :to_hash

    def values
      @errors.values
    end

  end
end
