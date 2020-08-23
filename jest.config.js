module.exports = {
  verbose: true,
  testEnvironment: 'node',
  transform: {
    '^.+\\.ts?$': 'babel-jest',
  },
  globals: {
    NODE_ENV: 'test',
  },
  moduleNameMapper: {
    '^@repositories/(.*)$': '<rootDir>/src/repositories/$1',
    '^@clients/(.*)$': '<rootDir>/src/clients/$1',
    '^@transformers/(.*)$': '<rootDir>/src/transformers/$1',
    '^@src/(.*)$': '<rootDir>/src/$1',
    '^@tests/(.*)$': '<rootDir>/tests/$1',
  },
  collectCoverage: true,
  coverageReporters: ['text'],
  coverageDirectory: 'coverage/',
};
