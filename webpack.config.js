import path from 'path';
import webpack from 'webpack';

module.exports = {
  entry: './src/app',
  mode: 'development',
  devtool: 'source-map',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'dist.js',
  },
  resolve: {
    extensions: ['.ts', '.js'],
    modules: [path.resolve(__dirname, 'src'), 'node_modules'],
  },
  module: {
    rules: [
      {
        test: /\.(ts|js)x?$/,
        include: __dirname,
        exclude: /node_modules/,
        loader: 'ts-loader',
      },
    ],
  },
  plugins: [],
};
